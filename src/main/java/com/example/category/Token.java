package com.example.category;

import java.util.Base64;

public class Token {
    public static String getValue() {
        String string = "kalit";
        Base64.Encoder encoder = Base64.getEncoder();
        return encoder.encodeToString(string.getBytes());
    }
}
