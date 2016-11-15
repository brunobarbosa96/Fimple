notify = {
    success: (texto, header) => {
        $.toast({
            heading: header,
            text: texto,
            position: 'top-left',
            stack: false,
            icon: 'success',
            loader: false
        });
    },
    error: (texto, header) => {
        $.toast({
            heading: header,
            text: texto,
            position: 'top-left',
            stack: false,
            icon: 'error',
            loader: false
        });
    },
    warn: (texto, header) => {
        $.toast({
            heading: header,
            text: texto,
            position: 'top-left',
            stack: false,
            icon: 'warning',
            loader: false
        });

    }
}