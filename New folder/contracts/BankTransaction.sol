
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract BankTransaction{

    struct Transaction{
        bytes20 payment_ID;
        address client_ID;
        address recipient_ID;
        uint amountOfPayment;
        uint timeOfPayment;
        string Remarks;
        bytes20 paymentHash;
    }
    Transaction public transactions;
    Transaction[]  ClientTXs;
    mapping(bytes20 => Transaction) public clienttransactions;
    mapping (address =>Transaction[]) public TXaddresses;
 //A function that initialize the transaction struct.
    function setTransaction(address clientID, address recipientID, uint amount,string calldata remarks) public {
       uint time = block.timestamp;
       bytes20 PaymentID = ripemd160(abi.encodePacked(clientID , recipientID, amount, time, remarks));
       bytes20 Hash = ripemd160(abi.encodePacked(PaymentID, clientID, recipientID, amount,time, remarks));
       transactions = Transaction(PaymentID,clientID,recipientID,amount,time,remarks,Hash);
    }

    function addTransaction() external {
         ClientTXs.push(transactions);
    }

    function getPaymentByID(bytes20 _payment_ID) public view  returns ( Transaction memory txs){
        txs = transactions;
        return  clienttransactions[_payment_ID];
    }

    function getAllTransactionsOfAClient(address  _client_ID) public  view  returns (Transaction[] memory all ){
        all = ClientTXs;
        return TXaddresses[_client_ID] ;
    }

    /*There must be a BankTransaction structure in the contract, which
consists of the following fields: payment identifier (combination of letters and
digits), client identifier (combination of letters and digits), recipient identifier,
amount of the payment, time of the payment, note to the payment, the hashvalue of the payment obtained by concatenating the identifiers, the amount
and the time of the payment and hashing the resulting string using any
algorithm available in Solidity.
The contract must contain the following functions: adding a new
payment, getting information about the payment by its identifier, getting all
payments of a particular customer.*/
}