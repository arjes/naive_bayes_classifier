
# Instead of poluting enumerable or Math, just put it in here
module NaiveBayesClassifier
  module ClassifierMath
    def self.mean arr
      unless arr.empty?
        arr.inject(:+) / arr.length.to_f
      end
    end

    def self.variance arr
      unless arr.empty?
        mean = mean(arr)
 
        arr.inject(0) do |sum, value|
          sum + (value - mean) ** 2
        end / arr.length
      end
    end
  end
end
