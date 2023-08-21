pragma circom 2.0.0;

/*This circuit template checks that final_output is the multiplication of first_input and second_input.*/  

template LogicCircuit () {  

   //input signals
   signal input first_input;
   signal input second_input;

   //Gate signals
   signal N;
   signal M;

   //Output signals
   signal output final_output;

   //Component gates
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   //Logic of circuits
   andGate.a <== first_input;
   andGate.b <== second_input;
   N <== andGate.out;

   notGate.in <== second_input;
   M <== notGate.out;

   orGate.a <== N;
   orGate.b <== M;
   final_output <== orGate.out;

}

template OR(){
   signal input a;
   signal input b;
   signal output out;
   out <== a+b-a*b;
}

template NOT(){
   signal input in;
   signal output out;
   out <== 1+in-2*in;
}

template AND(){
   signal input a;
   signal input b;
   signal output out;
   out <== a*b;
}

component main = LogicCircuit();
