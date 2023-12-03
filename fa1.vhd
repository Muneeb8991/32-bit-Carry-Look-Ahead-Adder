entity fullAdder is
  port (a, b, cin: in bit;
    sum, cout: out bit
  );
end fullAdder;

architecture dataflow of fullAdder is
begin
  sum <= a xor b xor cin;
  cout <= (a and b) or (a and cin) or (b and cin);
end dataflow;
