package entity;

public class PaymentMethodID {
    private String paymentMethodID;
    private String TNG;
    private String creditCard;
    private String debitCard;
    private String duitNow;

    public PaymentMethodID() {}

    public PaymentMethodID(String paymentMethodID, String TNG, String creditCard, String debitCard, String duitNow) {
        this.paymentMethodID = paymentMethodID;
        this.TNG = TNG;
        this.creditCard = creditCard;
        this.debitCard = debitCard;
        this.duitNow = duitNow;
    }

    public String getPaymentMethodID() { return paymentMethodID; }
    public void setPaymentMethodID(String paymentMethodID) { this.paymentMethodID = paymentMethodID; }

    public String getTNG() { return TNG; }
    public void setTNG(String TNG) { this.TNG = TNG; }

    public String getCreditCard() { return creditCard; }
    public void setCreditCard(String creditCard) { this.creditCard = creditCard; }

    public String getDebitCard() { return debitCard; }
    public void setDebitCard(String debitCard) { this.debitCard = debitCard; }

    public String getDuitNow() { return duitNow; }
    public void setDuitNow(String duitNow) { this.duitNow = duitNow; }
}