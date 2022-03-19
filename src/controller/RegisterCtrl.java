package controller;

import model.Subscription;
import model.Trainee;
import view.RegisterView;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class RegisterCtrl implements ActionListener {

    private final String password = "1234";
    private final String user = "postgres";
    private final String url = "jdbc:postgresql://localhost:5432/gym";
    private Trainee trainee = new Trainee();
    ArrayList<Subscription> subscriptionArrayList;
    RegisterView registerView = new RegisterView();
    public RegisterCtrl(ArrayList<Subscription> subscriptionArrayList){
        registerView.addActionListener(registerView.getRegister(), this);
        registerView.addActionListener(registerView.getBack(), this);
        this.subscriptionArrayList = subscriptionArrayList;
    }

    public Connection connect() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    public long insertTrainee(Trainee trainee) {
        String SQL = "INSERT INTO trainees(trainee_name, age, weight, id_subscription, gym_password) "
                + "VALUES(?,?,?,?,?)";

        //String SQL = "INSERT INTO bills(type, cost, due_date, paid)" + "VALUES(?,?,?,?)";

        long id = 0;

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(SQL,
                     Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, trainee.getFullName());
            pstmt.setInt(2, trainee.getAge());
            pstmt.setInt(3, trainee.getWeight());
            pstmt.setInt(4, trainee.getSubscription().getSubscription().ordinal()+1);
            pstmt.setString(5, trainee.getPassword());
           // pstmt.setDate(5, trainee.getSQLDate());

            int affectedRows = pstmt.executeUpdate();
            // check the affected rows
            if (affectedRows > 0) {
                // get the ID back
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = rs.getLong(1);
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==registerView.getRegister()) {
            try{
            trainee.setFullName(registerView.getUsernameTF().getText());
            trainee.setAge(Integer.parseInt(registerView.getAgeTF().getText()));
            trainee.setSubscription(subscriptionArrayList.get(registerView.getSubscriptionCB().getSelectedIndex()));
            trainee.setWeight(Integer.parseInt(registerView.getWeightTF().getText()));
            trainee.setSubscription_due_date(trainee.getSubscription());
            trainee.setPassword(String.valueOf(registerView.getPasswordField().getPassword()));

            //System.out.println(trainee.getSubscription().getSubscription());
            //System.out.println(trainee.getSubscription_due_date());
            if(!checkAlreadyExists(registerView.getUsernameTF().getText())) {
                insertTrainee(trainee);
                if(registerView.getUsernameTF().getText().isBlank() || String.valueOf(registerView.getPasswordField().getPassword()).isBlank()) {
                    JOptionPane.showMessageDialog(null, "Invalid username or password!", "REGISTRATION", JOptionPane.ERROR_MESSAGE);
                    return;
                }
                else
                JOptionPane.showMessageDialog(null, "Registration successful!", "REGISTRATION", JOptionPane.INFORMATION_MESSAGE);
            }else {
                JOptionPane.showMessageDialog(null, "This username is already taken", "BAD USERNAME", JOptionPane.ERROR_MESSAGE);
                registerView.getUsernameTF().setText("");
                return;
            }
                MainCtrl mainCtrl = new MainCtrl();
                registerView.dispose();
            }
            catch (NumberFormatException nfex){
                JOptionPane.showMessageDialog(null, "Bad input: you entered a character in a field which accepts only numbers", "BAD INPUT", JOptionPane.ERROR_MESSAGE);
                registerView.getAgeTF().setText("");
                registerView.getWeightTF().setText("");
            }
        }
        else {
            MainCtrl mainCtrl = new MainCtrl();
            registerView.dispose();
        }
    }

    public boolean checkAlreadyExists(String username) {
        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement pst = con.prepareStatement("SELECT * FROM trainees");
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                if(username.equals(rs.getString(2)))
                    return true;
            }

        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(AccountCtrl.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }

        return false;
    }
}
