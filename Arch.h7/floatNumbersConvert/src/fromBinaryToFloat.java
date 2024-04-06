public class fromBinaryToFloat {
    public static void main(String[] args) {
        String hexnum = "42f83f8a";
        String binaryString = hexToBinary(hexnum);
        float result = decode(binaryString);
        System.out.println(" Десятковий вигляд: " + result);
    }

    public static float decode(String binaryString) {

        char signBit = binaryString.charAt(0);

        String exponentBits = binaryString.substring(1, 9);
        String mantissaBits = binaryString.substring(9);

        int exponent = Integer.parseInt(exponentBits, 2);

        float mantissa = 1.0f;
        for (int i = 0; i < mantissaBits.length(); i++) {
            if (mantissaBits.charAt(i) == '1') {
                mantissa += Math.pow(2, -(i + 1));
            }
        }

        mantissa *= Math.pow(2, exponent - 127);

        if (signBit == '1') {
            mantissa *= -1;
        }

        return mantissa;
    }
    public static String hexToBinary(String hexnum) {
        // Перетворення шістнадцяткового числа в бінарний рядок
        String binaryString = "";
        for (int i = 0; i < hexnum.length(); i++) {
            char hexChar = hexnum.charAt(i);
            // Перетворюємо кожен символ шістнадцяткового числа в його відповідне 4-бітне бінарне представлення
            String binary = Integer.toBinaryString(Integer.parseInt(String.valueOf(hexChar), 16));
            // Додаємо ведучі нулі, якщо необхідно
            while (binary.length() < 4) {
                binary = "0" + binary;
            }
            binaryString += binary;
        }

        return binaryString;
    }
}


