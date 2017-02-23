package main.java.dao;

import main.java.model.User;

import java.util.List;

/**
 * Created by Suntey on 14.02.2017.
 */
public interface UserDao {
    void createUser(User user);

    void updateUser(User user);

    void deleteUser(int id);

    User getUserById(int id);

    List<User> listUsers();
}
