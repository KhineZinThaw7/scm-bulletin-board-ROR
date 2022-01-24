class CategoriesService
    # category list
    def self.categoryList
        categories = CategoriesRepository.getCategoryList
    end

    # category detail
    def self.categoryDetail(id)
        category = CategoriesRepository.getCategoryId(id)
    end

    # create category
    def self.createCategory(category_params)
        category = Category.new(category_params)
        isSaveCategory = CategoriesRepository.createCategory(category)
    end

    # edit category
    def self.editCategory(id)
        category = CategoriesRepository.getCategoryId(id)
    end

    # update category
    def self.updateCategory(id, category_params)
        category = CategoriesRepository.getCategoryId(id)
        isUpdateCategory = CategoriesRepository.updateCategory(category)
    end

    # delete category
    def self.destroyCategory(id)
        category = CategoriesRepository.getCategoryId(id)
        isDeleteCategory = CategoriesRepository.destroyCategory(category)
    end
end