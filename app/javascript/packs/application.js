// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function () {
    if ($('#chat-room').length > 0) {
        $('#chat-room').scrollTop($('#chat-room')[0].scrollHeight);
    }

    function previewImages() {
        var $preview = $('#preview').empty();
        if (this.files) $.each(this.files, readAndPreview);

        function readAndPreview(i, file) {
            if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                // return alert(file.name + " is not an image");
                var reader = new FileReader();
                $(reader).on("load", function () {
                    $preview.append($("<p/>", {text: file.name, height: 30}));
                });
                reader.readAsDataURL(file);
            } else {
                var reader = new FileReader();
                $(reader).on("load", function () {
                    $preview.append($("<img/>", {src: this.result, height: 100}));
                });
                reader.readAsDataURL(file);
            }
        }
    }
    $('#message_docs').on("change", previewImages);
})