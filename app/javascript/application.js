import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

// Dropdown
var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
  return new bootstrap.Dropdown(dropdownToggleEl)
})

// Tooltips
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

//Build Tabulator
var table = new Tabulator("#example-table", {
    layout:"fitColumns",
    pagination:"local",
    paginationSize:5,
    paginationSizeSelector:[5, 10, 15, 20],
    movableColumns:true,
    columns:[
            {title:"Avatar", field:"avatar", formatter:"html", width:200},
            {title:"Full name", field:"fullname", formatter:"progress", sorter:"number"},
            {title:"Gender", field:"gender"},
            {title:"Rating", field:"rating", formatter:"star", hozAlign:"center", width:100},
            {title:"Favourite Color", field:"col"},
            {title:"Date Of Birth", field:"dob", hozAlign:"center", sorter:"date"},
            {title:"Driver", field:"car", hozAlign:"center", formatter:"tickCross"},
        ],
});
