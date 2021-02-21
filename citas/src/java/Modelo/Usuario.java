/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.LinkedList;

/**
 *
 * @author isra9
 */
public class Usuario {

    //Atributos  usuario 
    private int id_user;
    private String dni;
    private String email;
    private String nick;
    private String password;
    private String tlf;
    private int age;
    private boolean active;
    private boolean online;
    private boolean firstTime;

    //Roles
    private int rol;

    //Constructor usuario Actual
    public Usuario(int id_user, String email, String dni, String nick, String password, String tlf, int age, boolean active) {
        this.id_user = id_user;
        this.email = email;
        this.dni = dni;
        this.nick = nick;
        this.password = password;
        this.tlf = tlf;
        this.age = age;
        this.active = active;
        this.online = true;
        this.firstTime = false;
    }

    //Constructor usuario con datos de BD
    public Usuario(int id_user, String dni, String email, String nick, String password, String tlf, int age, boolean active, boolean online, boolean firstTime, int rol) {
        this.id_user = id_user;
        this.dni = dni;
        this.email = email;
        this.nick = nick;
        this.password = password;
        this.tlf = tlf;
        this.age = age;
        this.active = active;
        this.online = online;
        this.firstTime = firstTime;
        this.rol = rol;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTlf() {
        return tlf;
    }

    public void setTlf(String tlf) {
        this.tlf = tlf;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isOnline() {
        return online;
    }

    public void setOnline(boolean online) {
        this.online = online;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public boolean isFirstTime() {
        return firstTime;
    }

    public void setFirstTime(boolean firstTime) {
        this.firstTime = firstTime;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id_user=" + id_user + ", dni=" + dni + ", email=" + email + ", nick=" + nick + ", password=" + password + ", tlf=" + tlf + ", age=" + age + ", active=" + active + ", online=" + online + ", firstTime=" + firstTime + ", rol=" + rol + '}';
    }

}
