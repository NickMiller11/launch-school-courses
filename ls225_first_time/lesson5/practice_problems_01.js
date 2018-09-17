// function makeObj() {
//   var obj = {};
//   obj.propA = 10;
//   obj.propB = 20;
//   return obj;
// }

// function makeObj() {
//   return {
//     propA: 10,
//     propB: 20,
//   };
// }

/*
In the following problems, we'll be working through an invoice processing
program. To get you started, we provide you with the following code that can
process one invoice:

var invoice = {
  phone: 3000,
  internet: 6500,
};
var payment = {
  phone: 1300,
  internet: 5500,
};
var invoiceTotal = invoice.phone + invoice.internet;
var paymentTotal = payment.phone + payment.internet;
var remainingDue = invoiceTotal - paymentTotal;

console.log(paymentTotal);         // 6800
console.log(remainingDue);         // 2700

To be able to process multiple invoices, we'll need to have a factory method
that we can use to create invoices. The requirements for this factory function
are the following:

It returns an invoice object, with phone and internet properties, and a total method.
The default value for the phone service is 3000, and the internet service is 5500
(in cents, of course!).

The function takes an object argument with attributes to override the default
values. Your implemented function should be able to work with the code below:


*/

function createInvoice(services) {
  services = services || {}
  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    payments: [],

    total: function() {
      return this.phone + this.internet;
    },

    addPayment: function(payment) {
      this.payments.push(payment);
    },

    addPayments: function(payments) {
      var i;

      for (i = 0, i < payments.length; i += 1) {
        this.addPayment(payments[i]);
      }
    },

    paymentTotal: function() {
      var i;
      var totalPaid = 0;

      for (i = 0; i < payments.length; i += 1) {
        totalPaid += payments[i].total();
      };

      return totalPaid;
    },

    amountDue: function() {
      return this.total() - this.paymentTotal();
    },
  };
}

function invoiceTotal(invoices) {
  var total = 0;
  var i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

var invoices = [];
invoices.push(createInvoice());
invoices.push(createInvoice({
  internet: 6500,
}));

invoices.push(createInvoice({
  phone: 2000,
}));

invoices.push(createInvoice({
  phone: 1000,
  internet: 4500,
}));

console.log(invoiceTotal(invoices));             // 31000

/*
Now let's build a factory function to create payments. The function can take
an object argument in one of 3 forms:

Payment for one service, such as: {internet: 1000} or {phone: 1000}
Payment for both services, such as: {internet: 2000, phone: 1000}.
Payment with just an amount property, such as: {amount: 2000}.
and should return an object that has paid services, and a total method that
returns the payment total. If the amount property is not present, this should
return the sum of phone and internet services; if the amount property is present,
just return the value of that property.

Your code should work with the following:
*/

function createPayment(services) {
  var services = services || {}
  return {
    phone: services.phone || 0,
    internet: services.internet || 0,
    amount: services.amount,
    total: function () {
      return this.amount || this.phone + this.internet;
    },
  };
}

function paymentTotal(payments) {
  var total = 0;
  var i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

var payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone: 2000,
}));

payments.push(createPayment({
  phone: 1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount: 10000,
}));

console.log(paymentTotal(payments));      // 24000
