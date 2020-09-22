/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.poo;

/**
 *
 * @author Rogerio
 */
public class Horario {
    private int horas;
    private int minutos;
    private int segundos;

    public Horario() {
    }

    public Horario(int hora, int minutos) {
        this.horas = hora;
        this.minutos = minutos;
    }

    public Horario(int horas, int minutos, int segundos) {
        this.horas = horas;
        this.minutos = minutos;
        this.segundos = segundos;
    }
    
    public String getHorário(){
        String out = "";
        if(horas<10) out+="0";
        out+=horas+":";
        if(minutos<10) out+="0";
        out+=minutos+":";
        if(segundos<10) out+="0";
        out+=segundos;
        return out;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    public int getMinutos() {
        return minutos;
    }

    public void setMinutos(int minutos) {
        this.minutos = minutos;
    }

    public int getSegundos() {
        return segundos;
    }

    public void setSegundos(int segundos) {
        this.segundos = segundos;
    }
    
}
