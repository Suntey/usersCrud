package main.java.service;


import main.java.dao.UserDao;
import main.java.model.User;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * Created by Suntey on 14.02.2017.
 */
@Transactional
public class UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public void createUser(User user){
        this.userDao.createUser(user);
    }

    @Transactional
    public void updateUser(User user){
        this.userDao.updateUser(user);
    }

    @Transactional
    public void deleteUser(int id){
        this.userDao.deleteUser(id);
    }

    @Transactional
    public User getUserById(int id){
        return this.userDao.getUserById(id);
    }

    @Transactional
    public List<User> listUsers(){
        return this.userDao.listUsers();
    }

    @Transactional
    public List<User> listUsers(String name){
        return this.userDao.listUsers(name);
    }



}
