<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <style>
            html, body {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
            }
            form {
                flex: 1;
            }
            h1 {
                text-align: center;
                width: 100%;
                font-size: 3rem;
            }
            .checkout-wrapper {
                display: flex;
                flex-direction: column;
                gap: 2rem;
                padding: 2.25rem;
            }
            .wrapper {
                display: flex;
                flex-direction: row;
                gap: 2rem;
                align-items: flex-start;
            }

            .checkout-container {
                display: flex;
                flex-direction: column;
                gap: 2rem;
                width: 50%;
            }
            .shipping-container,
            .payment-container {
                display: flex;
                flex-direction: column;
                gap: 1.25rem;
            }
            .shipping-title,
            .payment-title {
                font-size: 1.5rem;
                font-weight: bold;
            }
            .shipping-grid,
            .payment-grid {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 1rem;
                font-size: 1.125rem;
            }
            .input-group {
                display: flex;
                flex-direction: column;
                gap: 0.25rem;
                font-size: 1.125rem;
                width: 100%;
            }
            .input-icon-container {
                position: relative;
                width: 100%;
                display: flex;
                align-items: center;
            }
            .input-field {
                border-radius: 0.25rem;
                padding: 0.5rem 0.75rem;
                height: 2.25rem;
                background-color: #efeff0;
                border: none;
                font-size: 1.125rem;
            }
            .input-icon {
                position: absolute;
                left: 10px;
                font-size: 1.2rem;
                color: gray;
            }

            .input-field.with-icon {
                padding-left: 2.5rem;
                width: 100%;
                box-sizing: border-box;
            }
            .full-width {
                grid-column: span 2;
            }
            .select-container {
                position: relative;
                width: 100%;
            }

            .select-field {
                appearance: none;
                padding-left: 0.75rem;
                padding-right: 2.5rem;
                border-radius: 0.25rem;
                width: 100%;
                height: 2.25rem;
                background-color: #efeff0;
                border: none;
                font-size: 1.125rem;
            }

            .select-icon {
                position: absolute;
                top: 50%;
                right: 1rem;
                transform: translateY(-50%);
                pointer-events: none;
                font-size: 1rem;
            }


            .payment-method-container {
                display: flex;
                flex-direction: row;
                gap: 2.5rem;
                font-size: 1.25rem;
                font-weight: 500;
            }

            .payment-option {
                display: flex;
                flex-direction: row;
                gap: 0.75rem;
                align-items: center;
            }

            .payment-option input {
                cursor: pointer;
            }

            .bank-fields .select-container {
                margin-top: 0.25rem;
            }

            .order-summary-container {
                display: flex;
                flex-direction: column;
                gap: 2.5rem;
                width: 50%;
                height: fit-content;
                padding-left: 1rem;
                padding-right: 2rem;
            }

            .order-details {
                display: flex;
                flex-direction: column;
                gap: 1.25rem;
            }

            .order-item {
                display: flex;
                flex-direction: row;
                gap: 1rem;
                align-items: center;
            }

            .order-item-thumbnail {
                width: 4rem;
                height: 4rem;
                background-color: black;
                border-radius: 4px;
            }

            .order-item-info {
                display: flex;
                flex-direction: row;
                width: 100%;
                justify-content: space-between;
            }

            .order-item-details {
                display: flex;
                flex-direction: column;
                gap: 0.25rem;
            }

            .order-item-details span:first-child {
                font-weight: bold;
            }

            .order-price {
                font-weight: bold;
            }

            .order-summary {
                display: flex;
                flex-direction: column;
                gap: 0.75rem;
                font-size: 1rem;
            }

            .order-summary-row {
                display: flex;
                flex-direction: row;
                width: 100%;
                justify-content: space-between;
            }

            .order-total {
                font-size: 1.25rem;
            }

            .font-bold {
                font-weight: bold;
            }
            .submit-button {
                background-color: #4A5C6A;
                padding: 0.75rem;
                color: white;
                font-size: 1.25rem;
                width: 100%;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <form>
            <div class="checkout-wrapper">
                <h1>CHECKOUT</h1>
                <div class="wrapper full-width">
                    <div class="checkout-container">
                        <div class="shipping-container">
                            <div class="shipping-title">1. Shipping Address</div>
                            <div class="shipping-grid">
                                <div class="input-group full-width">
                                    <label for="first-name">Name</label>
                                    <div class="input-icon-container">
                                        <span class="input-icon"><i class="fa fa-user"></i></span>
                                        <input id="name" type="text" class="input-field with-icon" placeholder="Enter name"/>
                                    </div>
                                </div>
                                <div class="input-group full-width">
                                    <label for="street-address">Street Address</label>
                                    <div class="input-icon-container">
                                        <span class="input-icon"><i class="fa fa-home"></i></span>
                                        <input id="address" type="text" class="input-field with-icon" placeholder="Enter street address"/>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <label for="state">State</label>
                                    <div class="select-container">
                                        <select id="state" class="select-field" name="State">
                                            <option>Johor</option>
                                            <option>Kedah</option>
                                            <option>Kelantan</option>
                                            <option>Melaka</option>
                                            <option>Negeri Sembilan</option>
                                            <option>Pahang</option>
                                            <option>Perak</option>
                                            <option>Perlis</option>
                                            <option>Pulau Pinang</option>
                                            <option>Sabah</option>
                                            <option>Sarawak</option>
                                            <option>Selangor</option>
                                            <option>Terengganu</option>
                                            <option>Wilayah Persekutuan Kuala Lumpur</option>
                                            <option>Wilayah Persekutuan Labuan</option>
                                            <option>Wilayah Persekutuan Putrajaya</option>
                                        </select>
                                        <div class="select-icon">▼</div>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <label for="city">City</label>
                                    <div class="input-icon-container">
                                        <span class="input-icon"><i class="fa fa-map-marker-alt"></i></span>
                                        <input id="city" type="text" class="input-field with-icon" placeholder="Enter city"/>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <label for="postcode">Postcode</label>
                                    <div class="input-icon-container">
                                        <span class="input-icon"><i class="fa fa-tag"></i></span>
                                        <input id="postcode" type="text" class="input-field with-icon" placeholder="Enter postcode"/>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <label for="phone">Phone Number</label>
                                    <div class="input-icon-container">
                                        <span class="input-icon"><i class="fa fa-phone"></i></span>
                                        <input id="phone" type="text" class="input-field with-icon" placeholder="Enter phone number"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="payment-container">
                            <div class="payment-title">2. Payment Option</div>
                            <div class="payment-method-container">
                                <div class="payment-option">
                                    <input type="radio" name="payment-method" value="credit-debit" checked>
                                    <span>Credit / Debit Card</span>
                                </div>
                                <div class="payment-option">
                                    <input type="radio" name="payment-method" value="online-banking">
                                    <span>Online Banking</span>
                                </div>
                                <div class="payment-option">
                                    <input type="radio" name="payment-method" value="e-wallet">
                                    <span>E-Wallet</span>
                                </div>
                            </div>
                            <div class="payment-grid">
                                <div class="payment-grid card-fields full-width">
                                    <div class="input-group">
                                        <label for="card-number">Card Number</label>
                                        <div class="input-icon-container">
                                            <span class="input-icon"><i class="fa fa-credit-card"></i></span>
                                            <input id="card-number" type="text" class="input-field with-icon" placeholder="Enter card number" />
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label for="card-name">Name on Card</label>
                                        <div class="input-icon-container">
                                            <span class="input-icon"><i class="fa fa-id-card"></i></span>
                                            <input id="card-name" type="text" class="input-field with-icon" placeholder="Enter name on card"/>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label for="cvv">CVV</label>
                                        <div class="input-icon-container">
                                            <span class="input-icon"><i class="fa fa-lock"></i></span>
                                            <input id="cvv" type="text" class="input-field with-icon" placeholder="Enter CVV"/>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <label for="expiration-date">Expiration Date</label>
                                        <div class="input-icon-container">
                                            <span class="input-icon"><i class="fa fa-calendar"></i></span>
                                            <input id="expiry" type="text" class="input-field with-icon" placeholder="MM/YY"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="input-group bank-fields full-width">
                                    <label for="bank-name">Bank Name</label>
                                    <div class="select-container">
                                        <select id="bank-name" class="select-field" name="Bank-Name">
                                            <option>Affin Bank</option>
                                            <option>Agrobank</option>
                                            <option>Alliance Bank</option>
                                            <option>AmBank</option>
                                            <option>Bank Islam</option>
                                            <option>Bank Muamalat</option>
                                            <option>Bank Rakyat</option>
                                            <option>CIMB Bank</option>
                                            <option>Citibank</option>
                                            <option>Hong Leong Bank</option>
                                            <option>HSBC Bank</option>
                                            <option>Maybank</option>
                                            <option>OCBC Bank</option>
                                            <option>Public Bank</option>
                                            <option>RHB Bank</option>
                                            <option>Standard Chartered Bank</option>
                                            <option>UOB Bank</option>
                                        </select>
                                        <div class="select-icon">▼</div>
                                    </div>
                                </div>
                                <div class="ewallet-message full-width">
                                    <span>You will be redirected to the payment gateway page after you confirm your order details.</span>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="order-summary-container">
                        <h2>Order Summary</h2>
                        <div class="order-details">
                            <div class="order-item">
                                <div class="order-item-thumbnail"></div>
                                <div class="order-item-info">
                                    <div class="order-item-details">
                                        <span>iMac</span>
                                        <span>512 GB</span>
                                        <span>Qty: 1</span>
                                    </div>
                                    <div class="order-price">RM 4,099</div>
                                </div>
                            </div>
                            <div class="order-summary">
                                <div class="order-summary-row">
                                    <div class="font-bold">Cart Total</div>
                                    <div>RM 4099.00</div>
                                </div>
                                <div class="order-summary-row">
                                    <div class="font-bold">Total Discount</div>
                                    <div>- RM 20.00</div>
                                </div>
                                <div class="order-summary-row">
                                    <div class="font-bold">Shipping Subtotal (Incl. SST)</div>
                                    <div>RM 10.00</div>
                                </div>
                                <div class="order-summary-row order-total">
                                    <div class="font-bold">Order Total</div>
                                    <div class="font-bold">RM 4089.00</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="submit-button">Place Order</button>
            </div>
        </form>
        <jsp:include page="footer.jsp" />
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const paymentOptions = document.querySelectorAll('input[name="payment-method"]');
            const cardFields = document.querySelector(".card-fields");
            const bankFields = document.querySelector(".bank-fields");
            const ewalletMessage = document.querySelector(".ewallet-message");

            function updatePaymentFields() {
                const selectedOption = document.querySelector('input[name="payment-method"]:checked').value;

                // Hide all sections first
                cardFields.style.display = "none";
                bankFields.style.display = "none";
                ewalletMessage.style.display = "none";

                // Show relevant section based on the selection
                if (selectedOption === "credit-debit") {
                    cardFields.style.display = "grid";
                } else if (selectedOption === "online-banking") {
                    bankFields.style.display = "block";
                } else if (selectedOption === "e-wallet") {
                    ewalletMessage.style.display = "block";
                }
            }

            // Add event listeners to radio buttons
            paymentOptions.forEach(option => {
                option.addEventListener("change", updatePaymentFields);
            });

            // Initialize the correct fields on page load
            updatePaymentFields();
        });
    </script>
</html>