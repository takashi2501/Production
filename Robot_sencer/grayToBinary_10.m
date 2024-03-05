% 10進数の数値を入力
decimal = input('Please enter a decimal number：');

% 数値を2進数の文字列に変換
gray = dec2bin(decimal);
% 文字列を配列に変換する
grayArr = double(gray) - '0';

% 最上位ビットを反映する
binaryArr = grayArr;
  for i = 1:length(grayArr)-1
      binaryArr(i+1) = xor(binaryArr(i), binaryArr(i+1));
  end

% 配列を文字列に変換する
binaryArr = char(binaryArr + '0');

% バイナリコードを10進数に変換
result = bin2dec(binaryArr);

% 結果を表示
disp(['Gray code: ' gray])
disp(['binary code: ' binaryArr]);
disp(['Decimal number: ' num2str(result)]);