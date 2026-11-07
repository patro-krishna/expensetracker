<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>


    <!-- Hero -->
    <main>

        <section class="hero">
            <div class="container hero-inner">

                <div class="hero-content">
                    <h1>
                        Take control of your
                        <span>expenses.</span>
                    </h1>

                    <p>
                        Track your spending, manage your expenses,
                        and understand where your money goes.
                    </p>

                    <div class="hero-actions">
                        <a href="register.jsp" class="btn btn-primary">
                            Get Started
                        </a>

                        <a href="login.jsp" class="btn btn-outline">
                            Login
                        </a>
                    </div>
                </div>


                <div class="hero-image">
                    <div class="expense-card">

                        <div class="expense-card-header">
                            <span>Total Expenses</span>
                            <span class="expense-icon">₹</span>
                        </div>

                        <h2>₹15,250.00</h2>

                        <div class="expense-row">
                            <span>Food</span>
                            <strong>₹3,250</strong>
                        </div>

                        <div class="expense-row">
                            <span>Transport</span>
                            <strong>₹2,100</strong>
                        </div>

                        <div class="expense-row">
                            <span>Shopping</span>
                            <strong>₹4,500</strong>
                        </div>

                        <div class="expense-row">
                            <span>Utilities</span>
                            <strong>₹5,400</strong>
                        </div>

                    </div>
                </div>

            </div>
        </section>

    </main>

<%@ include file="footer.jsp" %>