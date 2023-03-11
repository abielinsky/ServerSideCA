
    const form = document.querySelector('form');
    form.addEventListener('submit', (event) => {
    event.preventDefault();
    const productName = document.querySelector('input[name="product_name"]');
    const listPrice = document.querySelector('input[name="list_price"]');
    const discountPercent = document.querySelector('input[name="discount_percent"]');
    const description = document.querySelector('input[name="description"]');
    const quantity = document.querySelector('input[name="quantity"]');

    // Validate input fields
    let isValid = true;
    if (!productName.value.trim()) {
    isValid = false;
    alert('Please enter a product name.');
}
    if (!listPrice.value.trim()) {
    isValid = false;
    alert('Please enter a list price.');
} else if (isNaN(listPrice.value)) {
    isValid = false;
    alert('List price must be a number.');
}
    if (!discountPercent.value.trim()) {
    isValid = false;
    alert('Please enter a discount percent.');
} else if (isNaN(discountPercent.value)) {
    isValid = false;
    alert('Discount percent must be a number.');
}
    if (!description.value.trim()) {
    isValid = false;
    alert('Please enter a description.');
}
    if (!quantity.value.trim()) {
    isValid = false;
    alert('Please enter a quantity.');
} else if (isNaN(quantity.value)) {
    isValid = false;
    alert('Quantity must be a number.');
}

    if (isValid) {
    form.submit();
}
});

