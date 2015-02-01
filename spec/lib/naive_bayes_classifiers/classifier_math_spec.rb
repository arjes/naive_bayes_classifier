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

   describe "#sample_variance" do
     it "returns nil if the array is empty" do
       expect(ClassifierMath.sample_variance([])).to be_nil
     end

     it "returns the caluclate variance" do
       entries = [600, 470, 170, 430, 300]
       var = 27_130

       expect(ClassifierMath.sample_variance(entries)).to eq var
     end
   end
  end
end
