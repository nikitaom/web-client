package main.entity;

import java.util.List;

public class Data {
    private String operation;
    private List<User> userList;

    public Data() {
    }

    public Data(String operation, List<User> userList) {
        this.operation = operation;
        this.userList = userList;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public String toString() {
        return "Data{" +
                "operation='" + operation + '\'' +
                ", userList=" + userList +
                '}';
    }
}
