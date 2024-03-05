result = parityCheck();
disp(result);

function result = parityCheck()
    % Get input value from the user
    inputValue = input('Enter an 8-bit value in hexadecimal format: ', 's');
    
    % Convert hex value to binary
    binaryValue = dec2bin(hex2dec(inputValue), 8);
    
    % Extract data bits and parity bit
    dataBits = binaryValue(1:7);
    parityBit = binaryValue(8);
    
    % Compute parity for data bits
    computedParityBit = mod(sum(dataBits == '1'), 2);
    
    % Compare computed parity with input parity bit
    if num2str(computedParityBit) == parityBit
        result = 'ok';
    else
        result = 'error';
    end
end
