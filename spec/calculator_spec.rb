require './lib/calculator'
describe Calculator do
  let(:calculator) { Calculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number for a single input" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum for two comma-separated numbers" do
    expect(calculator.add("1,2")).to eq(3)
  end

  it "handles new lines as delimiters" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "raises an exception for negative numbers" do
    expect { calculator.add("1,-2,3,-4") }.to raise_error("Negatives not allowed: -2,-4")
  end
end
