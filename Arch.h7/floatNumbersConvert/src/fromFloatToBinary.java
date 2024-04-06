public class fromFloatToBinary {
    public static void main(String[] args) {
        float number = 44.50f;
        String Binary = convertToBinary(number);
         String HexNum = binaryToHex(Binary);
        System.out.println(HexNum);
    }

    public static String convertToBinary(float number) {
        int intBits = Float.floatToIntBits(number);

        String binaryString = Integer.toBinaryString(intBits);

        binaryString = String.format("%32s", binaryString).replace(' ', '0');

        char signBit = binaryString.charAt(0);

        String exponentBits = binaryString.substring(1, 9);

        String mantissaBits = binaryString.substring(9);


        return signBit + exponentBits + mantissaBits;
    }
    public static String binaryToHex(String Binary) {
        // Перевірка на правильність введення 32-бітного бінарного числа
        if (Binary.length() != 32 || !Binary.matches("[01]+")) {
            throw new IllegalArgumentException("Введене значення не є 32-бітним бінарним числом");
        }

        StringBuilder hexStr = new StringBuilder();
        for (int i = 0; i < 32; i += 4) {
            String nibble = Binary.substring(i, i + 4); // Відділяємо по 4 біти
            int decimalValue = Integer.parseInt(nibble, 2); // Перетворюємо в десяткове значення
            hexStr.append(Integer.toHexString(decimalValue)); // Додаємо шістнадцятковий символ
        }

        return hexStr.toString();
    }
}
