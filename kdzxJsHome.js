$(function(){
    // var userInfo
    if(!sessionStorage.getItem('token'))  {
        alert('登录信息无效')
        location.href = 'http://127.0.0.1:52330/kdzx/login.html'
    }else{
        // alert('WELCOME')
        $.ajaxSetup({
            headers:{
                'Authorization':sessionStorage.getItem('token')
            }
        })
    }
    $('.content').load('./page/welcome.html')
    $.get('http://47.93.255.92:7788/user/info',{token:sessionStorage.getItem('token')},(resp)=>{
        // userInfo = resp.data
        console.log(resp.data.userFace)
        $('.header_right img').attr('src',resp.data.userFace)
    })
    $('ul').on('click','li',(event)=>{
        console.log(event.target)
        switch ($(event.target).text().trim()){
                
            case '首页':
                $('.content').load('./page/welcome.html');
                break;
            case '栏目管理':
                $('.content').load('./page/category.html');
                break;
            case '文章管理':
                $('.content').load('./page/article.html');
                break;
            case '用户管理':
                $('.content').load('./page/user.html');
                break;
            case '评论管理':
                $('.content').load('./page/comments.html');
                break;
        }
    })
    $('.header_right_logout').on('click',()=>{
        $.ajax({
            url:'http://47.93.255.92:7788/user/logout',
            method:'POST',
            contentType:'application/json',
            data:{},
            success:(reps)=>{
                if(reps.status == 500){
                    alert(reps.message)
                }else{
                    sessionStorage.clear()
                    location.href = 'http://127.0.0.1:52330/kdzx/login.html'
                }
            },
            error:(resp)=>{
            }
        })
        
    })
})