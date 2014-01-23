require_relative 'matrix_calc'

describe MatrixCalc do
  let(:array1) do
    [
      [12,32, 9,11,34],
      [ 8,54,76,23,07],
      [27,18,25, 9,43],
      [11,23,78,63,19],
      [ 9,22,56,31,05]
    ]
  end

  let(:array2) do
    [
      [12,32],
      [ 8,54]
    ]
  end

  let(:array3) do
    [
      [12]
    ]
  end

  let(:array4) do
    8.times.map { 8.times.map { rand(1..100) } }
  end

  let(:array5) do
    [
      [12,32, 9,11,34]
    ]
  end

  let(:array6) do
    [
      [12],
      [ 8],
      [27],
      [11],
      [ 9]
    ]
  end

  let(:array7) do
    [
      [12,32, 9,11,34],
      [ 8,54,76,23],
      [27,18,25, 9,43],
      [11,23,78,63,19],
      [ 9,22,56,31,05]
    ]
  end

  let(:array8) do
    [
      []
    ]
  end

  let(:array9) do
    [
      1,2,3,4,5
    ]
  end

  let(:array10) do
    1
  end

  context 'when the array is not a matrix' do
    it "returns a error message" do
      expect(MatrixCalc.new(array7).calc).to eq 'The array is not a matrix'
      expect(MatrixCalc.new(array8).calc).to eq 'The array is not a matrix'
      expect(MatrixCalc.new(array9).calc).to eq 'The array is not a matrix'
      expect(MatrixCalc.new(array10).calc).to eq 'The array is not a matrix'
    end
  end

  context 'when the array is a matrix' do
    it "returns a correct result" do
      expect(MatrixCalc.new(array1).calc).to eq array1.flatten.inject(:+)
      expect(MatrixCalc.new(array2).calc).to eq array2.flatten.inject(:+)
      expect(MatrixCalc.new(array3).calc).to eq array3.flatten.inject(:+)
      expect(MatrixCalc.new(array4).calc).to eq array4.flatten.inject(:+)
      expect(MatrixCalc.new(array5).calc).to eq array5.flatten.inject(:+)
      expect(MatrixCalc.new(array6).calc).to eq array6.flatten.inject(:+)
    end
  end
end
