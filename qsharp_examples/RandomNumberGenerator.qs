import Std.Convert.*;
import Std.Math.*;

operation GenerateRandomBit() : Result{
    // allocate a qubit
    use q = Qubit();

    // set the qubit into superposition of 0 and 1 using the Hadamard
    H(q);

    // mesure the qubit and store the result
    let result = M(q);

    // reset qubit to the |0> state
    Reset(q);

    // return the result of the measurement
    return result;
}

/// Generates a random number between 0 and 'max'
operation GenerateRandomNumberInRange(max : Int) : Int {
    // Determine the number of bits needed to represent max and store it
    // in the `nBits` variable. Then generate `nBits` random bits which will
    // represent the generated random number.
    mutable bits = [];

    // Call the BitSizeI function from the Std.Math library to calculate the number of bits needed to represent the integer that's stored in max.
    let nBits = BitSizeI(max);

    // Use a for loop to generate a number of random bits equal to nBits. Call your GenerateRandomBit operation to generate the random bits.
    for idxBit in 1..nBits {
        // use the set statement to update the bits variable with each new random bit
        set bits += [GenerateRandomBit()];
    }

    // Call the ResultArrayAsInt function from the Std.Convert library to convert the array of bits in bits to a positive integer stored in sample.
    let sample = ResultArrayAsInt(bits);
    
    // Return random number if it's within the requested range.
    // Generate it again if it's outside the range.
    return sample > max ? GenerateRandomNumberInRange(max) | sample;
}

operation Main() : Int {
    let max = 100;
    Message($"Generating a random number between 0 and {max}: ");

    // Generate random number in the 0..max range.
    return GenerateRandomNumberInRange(max);
}