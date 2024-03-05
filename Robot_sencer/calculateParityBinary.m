function parityBit = calculateParityBinary(data)
    % データの各ビットをXOR演算子(^)を使って計算
    parityBit = mod(sum(bitget(data, 1:numel(data))), 2);
end