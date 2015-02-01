require 'spec_helper'


module NaiveBayesClassifier
  describe ClassifierMath do
   describe "#mean" do
     it "returns nil if the array is empty" do
       expect(ClassifierMath.mean([])).to be_nil
     end

     it "retuns the average of the values" do
       expect(ClassifierMath.mean([1,2])).to eq 1.5
     end
   end 

   describe "#variance" do
     it "returns nil if the array is empty" do
       expect(ClassifierMath.variance([])).to be_nil
     end

     it "returns the caluclate variance" do
       entries = [600, 470, 170, 430, 300]
       var = 21_704

       expect(ClassifierMath.variance(entries)).to eq var
     end
   end
  end
end
