/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

//show uploaded voter-image
$("input[name='set-image']").on("input", function ()
{
    let image = $(this)[0];

    if (image.files && image.files[0])
    {
        let reader = new FileReader();
        reader.onload = function (e)
        {
            $("img[name='view-image']").attr("src", e.target.result);
        };
        reader.readAsDataURL(image.files[0]);
    }
});

//remove uploaded voter-image
$("input[name='reset-image']").on("click", function ()
{
    $("img[name='view-image']").attr("src", "images/blank-image.png");
});
