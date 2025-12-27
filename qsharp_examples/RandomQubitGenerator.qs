// to generate a random bit, allocate a qubit in the |0> state
// put that bit into superposition state
// measure the qubit to produce a random bit value of either 0 or 1

operation Main() : Result{
    use q = Qubit();
    // apply the Hadamard operation to the qubit to put it into a superposition of the |0> and |1> state
    // to generate a random bit from the qubit measurement
    H(q);
    // qubit is now in an equal superposition state, ie 50% chance measurement returns a 0 or 1.
    // measure the qubit and store result
    let result = M(q);
    // reset the state before qubit can be released
    Reset(q);
    return result;
}