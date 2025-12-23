operation Main() : Result {
    // qubits are only accessible for the duration of the scope where they are allocated and are automatically released
    // at the end of the scope
    use qubit = Qubit();

    // set the qubit in superposition by applying a Hadamard transformation
    H(qubit);

    // measure the qubit. there is a 50% probability of measuring either 'zero' or 'one'
    let result = M(qubit);

    // reset the qubit so it can be safely released
    Reset(qubit);
    return result;
}