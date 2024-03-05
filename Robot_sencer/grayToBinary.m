function binary = grayToBinary(gray)
    % グレーコードをバイナリコードに変換する関数
    % 引数:
    %   gray: 変換するグレーコード（文字列）
    % 戻り値:
    %   binary: 変換されたバイナリコード（文字列）

    % 文字列を配列に変換する
    grayArr = double(gray) - '0';

    % 最上位ビットを反映する
    binaryArr = grayArr;
    for i = 1:length(grayArr)-1
        binaryArr(i+1) = xor(binaryArr(i), binaryArr(i+1));
    end

    % 配列を文字列に変換する
    binary = char(binaryArr + '0');

end