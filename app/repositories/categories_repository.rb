class CategoriesRepository
    # Get all category
    def self.getCategoryList
        categories = Category.all
    end

    # Create category
    def self.createCategory(category)
        isSaveCategory = category
    end

    # Update category
    def self.updateCategory(category)
        isUpdateCategory = category
    end

    # Delete category
    def self.destroyCategory(category)
        isDeleteCategory = category.delete
    end

    # Find category by id
    def self.getCategoryId(id)
        category = Category.find(id)
    end
end