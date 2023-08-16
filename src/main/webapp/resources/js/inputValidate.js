// 재고
function validateLeft() {
    var inputElement = document.getElementById("item_left_input");
    var value = parseInt(inputElement.value);
    
    console.log(inputElement);
    
    if (isNaN(value)) {
        // 입력 값이 숫자가 아닌 경우 초기화
        inputElement.value = "";
    } else if (value < 0) {
        // 입력 값이 최소값 미만인 경우 최소값으로 설정
        inputElement.value = inputElement.min;
    } else if (value > 100) {
        // 입력 값이 최대값 초과인 경우 최대값으로 설정
        inputElement.value = inputElement.max;
    }
}

// 원
function validateNumberInput(inputElement, minValue, maxValue) {
    var value = parseInt(inputElement.value);
    
    if (isNaN(value)) {
        // 입력 값이 숫자가 아닌 경우 초기화
        inputElement.value = "";
    } else if (value < minValue) {
        // 입력 값이 최소값 미만인 경우 최소값으로 설정
        inputElement.value = minValue;
    } else if (value > maxValue) {
        // 입력 값이 최대값 초과인 경우 최대값으로 설정
        inputElement.value = maxValue;
    }
}
