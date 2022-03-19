package view;

import model.Supplement;
import model.Trainer;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class AccountView extends JFrame {
    JLabel title = new JLabel("Welcome, ");
    JLabel cost = new JLabel("Total cost: ");
    JLabel weightLB = new JLabel("Current weight:");
    JLabel trainersLB = new JLabel("Available trainers:");
    JLabel supplementsLB = new JLabel("Available supplements:");
    JTextPane trainingLB = new JTextPane();

    JComboBox trainers;
    JComboBox supplements;

    JTextField weight = new JTextField();
    JCheckBox editWeight = new JCheckBox("Enable weight edit");
    JButton submitWeight = new JButton("SUBMIT");

    JButton training = new JButton("REQUEST TRAINING");
    JButton addSupplementToCart = new JButton("ADD SUPPLEMENT TO CART");
    JButton pay = new JButton("PAY NOW");

    public AccountView(ArrayList<Supplement> supplementArrayList, ArrayList<Trainer> trainerArrayList){
        title.setFont(new Font("Roboto", Font.PLAIN, 24));
        title.setHorizontalAlignment(JLabel.CENTER);


        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(7, 1, 50, 5));

        ArrayList<String> trainersName = new ArrayList<>();
        for(Trainer trainer : trainerArrayList)
            trainersName.add(trainer.getFullName());
        trainers = new JComboBox(trainersName.toArray());

        panel.add(weightLB);
        panel.add(weight);
        panel.add(editWeight);
        panel.add(submitWeight);
        panel.add(trainersLB);
        panel.add(trainers);
        panel.add(training);

        JPanel bottom = new JPanel();
        bottom.setLayout(new FlowLayout());
        bottom.add(cost);
        bottom.add(pay);

        JPanel right = new JPanel();
        right.setLayout(new GridLayout(3, 1, 50 ,5));
        ArrayList<String> supplementsName = new ArrayList<>();
        for(Supplement supplement : supplementArrayList)
            supplementsName.add(supplement.getName());
        supplements = new JComboBox(supplementsName.toArray());
        right.add(supplementsLB);
        right.add(supplements);
        right.add(addSupplementToCart);


        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLayout(new BorderLayout(100, 10));
        this.setSize(800, 500);
        this.setVisible(true);
        this.add(title, BorderLayout.NORTH);
        this.add(bottom, BorderLayout.SOUTH);
        this.add(panel, BorderLayout.WEST);
        this.add(right, BorderLayout.EAST);
        this.add(trainingLB, BorderLayout.CENTER);
        //this.pack();


    }
    public JTextField getWeight(){
        return weight;
    }
    public JCheckBox getEditWeight(){
        return editWeight;
    }
    public JButton getTraining(){
        return training;
    }
    public JButton getAddSupplementToCart(){return addSupplementToCart;}
    public JComboBox getTrainers(){return trainers;}
    public JComboBox getSupplements(){return  supplements;}
    public void setTitle(String username){this.title.setText(title.getText()+username);}
    public void setCost (String cost){
        this.cost.setText("Total cost: ");
        this.cost.setText(this.cost.getText()+cost);
    }
    public void addListener(JButton button, ActionListener e){button.addActionListener(e);}
    public void addCheckBoxListener (JCheckBox checkBox, ActionListener e){checkBox.addActionListener(e);}
    public boolean getCheckboxResponse(){return this.editWeight.isSelected();}

    public void setWeightLB(int weight) {
        weightLB.setText("Current weight: ");
        weightLB.setText(weightLB.getText()+weight);
    }

    public JTextPane getTrainingLB() {
        return trainingLB;
    }

    public JButton getSubmitWeight(){
        return submitWeight;
    }

    public JButton getPay() {
        return pay;
    }
}
