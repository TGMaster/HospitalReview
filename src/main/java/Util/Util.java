/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Database.AsymmetricCryptography;
import com.google.gson.Gson;
import java.security.PrivateKey;
import java.security.PublicKey;

/**
 *
 * @author TGMaster
 */
public class Util {

    private static final Gson gson = new Gson();

    public static String toJson(Object obj) {
        return gson.toJson(obj);
    }

    public static String encrypt(String msg) {

        try {
            AsymmetricCryptography ac = new AsymmetricCryptography();
            PrivateKey privateKey = ac.getPrivate("KeyPair/privateKey");
            return ac.encryptText(msg, privateKey);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static String decrypt(String msg) {

        try {
            AsymmetricCryptography ac = new AsymmetricCryptography();
            PublicKey publicKey = ac.getPublic("KeyPair/publicKey");
            return ac.decryptText(msg, publicKey);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }
}
