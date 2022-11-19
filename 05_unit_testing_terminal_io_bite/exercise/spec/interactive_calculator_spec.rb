require "interactive_calculator"

RSpec.describe InteractiveCalculator do
  it "substracts two numbers" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("3").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("4 - 3 = 1").ordered
    calculator = InteractiveCalculator.new(terminal)
    calculator.run
  end

  it "raises error if string entered instead of number for first gets" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("test").ordered
    
    calculator = InteractiveCalculator.new(terminal)
    expect{ calculator.run }.to raise_error "You must enter a number"
  end

  it "raises error if string entered instead of number for second gets" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("Test").ordered
    
    calculator = InteractiveCalculator.new(terminal)
    expect{ calculator.run }.to raise_error "You must enter a number"
  end
end
