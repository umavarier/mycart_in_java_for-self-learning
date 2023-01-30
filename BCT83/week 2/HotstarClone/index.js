let movies=[
    {
        name: "Bheeshma Parvam",
        des: "In the Anjootti family, not even a leaf moves without Michael's will. When rebellious youngsters start revolting, how will Michael hold his ground?",
        image: "images/bheeshma.webp"
    },
    {
        name:"Mulan",
        des: "Masquerading as a male soldier to protect her father and tested every step of the way, Mulan must harness her inner-strength and embrace her true potential.",
        image:"images/mulan.webp"
    },
    {
        name:"Saturday night",
        des:"Difference of opinion makes four thick friends walk away from each other. Years later, when they cross paths, will they be able to redefine their friendship? ",
        image:"images/saturday night.webp"
    }


];

const carousel=document.querySelector(".carousel");
let sliders=[];

let slideIndex=0; // track the current slide

const createSlide = () => {
        if(slideIndex>=movies.length){
            slideIndex=0;
        }

        //Create DOM Elements

        let slide=document.createElement('div');
        var imgElement=document.createElement('img');
        let content=document.createElement('div');
        let h1=document.createElement('h1');
        let p=document.createElement('p');


        //attaching all the elements

        imgElement.appendChild(document.createTextNode(""));
        h1.appendChild(document.createTextNode(movies[slideIndex].name));
        p.appendChild(document.createTextNode(movies[slideIndex].des));
        content.appendChild(h1);
        content.appendChild(p);
        slide.appendChild(content);
        slide.appendChild(imgElement);
        carousel.appendChild(slide);


        //setting up images

        imgElement.src=movies[slideIndex].image;
        slideIndex++;

        //setting elements classnames

        slide.className= "slider";
        content.className= "slide-content";
        h1.className="movie-title";
        p.className="movie-des";


        sliders.push(slide);

        if(sliders.length) {
            sliders[0].style.marginLeft = `calc(-${100 * (sliders.length -2)}% - ${
                30 * (sliders.length-2)
            }px)`;                                                                                  //42.01
        }
}


for(let i=0;i<3;i++)
{
    createSlide();
}

setInterval(()=>{
    createSlide();
}, 3000);


//video cards

const videoCards=[...document.querySelectorAll('.video-card')];
videoCards.forEach(item =>{
    item.addEventListener('mouseover',()=>{
        let video=item.children[1];
        video.play();

    });
    item.addEventListener('mouseleave',()=>{
        let video=item.children[1];
        video.pause();
    });
});
 //card sliders

 let cardContainers = [...document.querySelectorAll(".card-container")];
 let preBtns = [...document.querySelectorAll(".pre-btn")];
 let nxtBtns = [...document.querySelectorAll(".nxt-btn")];


 cardContainers.forEach((item,i)=>{
    let containerDimensions = item.getBoundingClientRect();
    let containerWidth= containerDimensions.width;

    nxtBtns[i].addEventListener('click', ()=>{
        item.scrollLeft+=containerWidth-200;
    })

    preBtns[i].addEventListener('click', () =>{
        item.scrollLeft-=containerWidth+200;
    })
 } )





