class CategoriesRepository
    def self.getCategoryList
        @categories = Category.all
    end

    def self.getCategoryDetail(id)
        @category = Category.find(id)
    end

    def self.createCategory(category)
        isSaveCategory = category
    end

    def self.updateCategory(category)
        isUpdateCategory = category
    end

    def self.destroyCategory(category)
        isDeleteCategory = category.delete
    end

    def self.getCategoryId(id)
        @category = Category.find(id)
    end
end