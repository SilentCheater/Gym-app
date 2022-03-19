package model;

 public class Person {
     protected int id;
     protected String fullName;
     protected int age;

     public int getId() {
         return id;
     }

     public void setId(int id) {
         this.id = id;
     }

     public String getFullName() {
         return fullName;
     }

     public void setFullName(String fullName) {
         this.fullName = fullName;
     }

     public int getAge() {
         return age;
     }

     public void setAge(int age) {
         this.age = age;
     }
 }
