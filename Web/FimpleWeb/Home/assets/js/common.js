String.prototype.validarEmail = function () {
    return /^([\w\d]+[\.\-\_]?[\w\d]{1})+\@[\w\d]+(\.[\w]{2,3}){1,2}$/.test(this.trim());
}

$.fn.validarEmail = function () {
    return this.val().validarEmail();
}