function parityBit = calculateParity(data)
    % データの各ビットを合計
    total = sum(data);
    
    % 合計が偶数か奇数かを確認し、パリティビットを設定
    if mod(total, 2) == 0
        parityBit = 0; % 偶数なのでパリティビットを0に設定
    else
        parityBit = 1; % 奇数なのでパリティビットを1に設定
    end
end

