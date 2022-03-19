package view;

import model.Subscription;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;

public class RegisterView extends JFrame {

    //TODO: getters and ctrl

    JLabel title = new JLabel("REGISTER");
    JLabel username = new JLabel("username");
    JLabel password = new JLabel("password");
    JLabel age = new JLabel("age");
    JLabel weight = new JLabel("weight");
    JLabel subscription = new JLabel("subscription");


    JTextField usernameTF = new JTextField();
    JPasswordField passwordField = new JPasswordField();
    JTextField ageTF = new JTextField();
    JTextField weightTF = new JTextField();
    JComboBox subscriptionCB = new JComboBox(Subscription.subscription.values());

    JButton register = new JButton("REGISTER");
    JButton back = new JButton("BACK");

    public RegisterView() {

        title.setFont(new Font("Roboto", Font.PLAIN, 24));
        title.setHorizontalAlignment(JLabel.CENTER);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(10, 1, 50, 5));

        panel.add(username);
        panel.add(usernameTF);
        panel.add(password);
        panel.add(passwordField);
        panel.add(age);
        panel.add(ageTF);
        panel.add(weight);
        panel.add(weightTF);
        panel.add(subscription);
        panel.add(subscriptionCB);

        JPanel bottom = new JPanel();
        bottom.setLayout(new FlowLayout());
        bottom.add(register);
        bottom.add(back);

        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLayout(new BorderLayout(100, 10));
        this.setSize(800, 500);
        this.setVisible(true);
        this.add(title, BorderLayout.NORTH);
        this.add(bottom, BorderLayout.SOUTH);
        this.add(panel, BorderLayout.CENTER);
        this.pack();
    }

    public JTextField getUsernameTF(){
        return usernameTF;
    }

    public JTextField getAgeTF(){
        return ageTF;
    }

    public JTextField getWeightTF(){return weightTF;}

    public JComboBox getSubscriptionCB() {
        return subscriptionCB;
    }

    public JPasswordField getPasswordField() {
        return passwordField;
    }

    public JButton getRegister() {
        return register;
    }

    public void addActionListener(JButton button, ActionListener e){button.addActionListener(e);}

    public JButton getBack() {
        return back;
    }

    public void reset(){
        usernameTF.setText("");
        passwordField.setText("");
        ageTF.setText("");
        weightTF.setText("");
    }
}
