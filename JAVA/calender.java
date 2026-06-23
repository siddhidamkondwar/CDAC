public class calender {
    private boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    public int getDaysInMonth(int month, int year) {
        if (month < 1 || month > 12) {
            throw new IllegalArgumentException("Invalid month: " + month);
        }
        int[] daysInMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (month == 2 && isLeapYear(year)) {
            return 29;
        }
        return daysInMonth[month - 1];
    }
    
}
public static void main(String[] args) {
    java.util.Scanner scanner = new java.util.Scanner(System.in);
    System.out.print("Enter year: ");
    int year = scanner.nextInt();
    System.out.print("Enter month: ");
    int month = scanner.nextInt();
    if (month < 1 || month > 12) {
        System.out.println("Invalid month");
    } else {
        calender cal = new calender();
        int days = cal.getDaysInMonth(month, year);
        System.out.println("Days in month: " + days);
    }
    scanner.close();
}