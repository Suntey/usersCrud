package main.java.model;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Suntey on 13.02.2017.
 */
@Entity
@Table(name = "users_view")
public class User {
    public User() {
    }

    public User(String userName, int age, boolean isAdmin, Timestamp createdDate) {
        this.userName = userName;
        this.age = age;
        this.isAdmin = isAdmin;
        this.createdDate = createdDate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int userId;

    @Column(name = "name")
    private String userName;

    @Column(name = "age")
    private int age;

    @Column(name = "isAdmin")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isAdmin;

    @Column(name = "createDate")
    @Type(type = "org.hibernate.type.TimestampType")
    @CreationTimestamp
    private Timestamp createdDate;

    public int getUserId() {return userId;}
    public String getUserName() {return userName;}
    public int getAge() {return age;}

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public boolean getAdmin() {

        return isAdmin;
    }

    public Timestamp getCreatedDate() {return createdDate; }

    public void setUserId(int userId) {this.userId = userId;}
    public void setUserName(String userName) {this.userName = userName;}
    public void setAge(int age) {this.age = age;}

    public void setCreaatedDate(Timestamp creaatedDate) {this.createdDate = creaatedDate;}

    @Override
    public String toString() {
        return "model.User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", age=" + age +
                ", isAdmin=" + isAdmin +
                ", creaatedDate=" + createdDate +
                '}';
    }
}
