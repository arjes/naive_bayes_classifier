


module NaiveBayesClassifier
  class Gaussian
    attr_accessor :training_sets, :statistics, :features

    def initialize
      self.training_sets = {}
      self.statistics    = {}
      self.features      = []
    end

    def validate_feature_set training_hash
    
    end

    def calcualte_statistics_for klass

    end

    def train! klass, training_sets

      calcualte_statistics_for klass
    end
  end
end
