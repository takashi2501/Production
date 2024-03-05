% Simulinkモデルのパスを指定します
modelPath = 'model1';

% Simulinkモデルを開きます
open_system(modelPath);

% モデルの入力・出力ポート情報を取得します
inputPorts = get_param(modelPath, 'InputPorts');
outputPorts = get_param(modelPath, 'OutputPorts');

% 入力・出力ポートの数を取得します
numInputs = inputPorts(1).Width;
numOutputs = outputPorts(1).Width;

% 状態空間行列の初期化
A = zeros(numInputs, numInputs);
B = zeros(numInputs, 1);
C = zeros(numOutputs, numInputs);
D = zeros(numOutputs, 1);

% モデル内のブロックを走査して状態空間行列を構築します
blocks = find_system(modelPath, 'SearchDepth', 1, 'BlockType', 'TransferFcn');
for i = 1:numel(blocks)
    blockPath = blocks{i};
    
    % ブロックのパラメータを取得します
    numerator = get_param(blockPath, 'Numerator');
    denominator = get_param(blockPath, 'Denominator');
    sampleTime = get_param(blockPath, 'SampleTime');
    
    % 伝達関数を状態空間行列に変換します
    tf = tf(ss(str2num(numerator), str2num(denominator), str2double(sampleTime)));
    
    % 状態空間行列を更新します
    A = A + tf.A;
    B = B + tf.B;
    C = C + tf.C;
    D = D + tf.D;
end

% 状態空間行列を表示します
disp('A:');
disp(A);
disp('B:');
disp(B);
disp('C:');
disp(C);
disp('D:');
disp(D);
