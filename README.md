# Thirty-Apps-in-Swift
Thirty simple swift apps

#### 题记
一直想学习swift，因为目前项目还是用纯OC写的，所以每次都是看看API啥的，没有真正用过。一直也不知道从何处下手好。在网上看到有人发起30天30个swift的学习，觉得自己也可以这么试试。因此决定参考他们，自己也来写30个小App来学习下swift。

#### 参考资料
[国外这个比较牛逼](https://samvlu.com/index.html)


[简书 Allen_朝辉](https://www.jianshu.com/p/52032bc4cbe4)

[APP github 链接](https://github.com/allenwong/30DaysofSwift)


[nimomeng](https://juejin.im/post/5c618227518825625c270640)

[app github 链接](https://github.com/nimomeng/30-swift-projects-in-30-days)



#### 具体内容
1.day1. 简单的定时器和字体转变  Timer 、tableView
学到：swift初尝，属性、方法等的使用。 定时器Timer的简单使用。

2.day2. 定位-及其位置转换  CoreLocation
学到：定位的简单使用，swift里还有一个模糊蒙层UIVisualEffectView功能。
这里多啰嗦一句，swift是真心强大以及简单，赶紧拥抱吧

3.day3. 本地视频加载播放
学到：视频加载播放功能，复习tableView的使用.  闭包回调，结构体等
之前从没用过xib， 试试新建一个cell 用xib

4.day4.文本限制输入字数，最简单的刷新UIRefreshControl
学到：解决自定义cell ，在初始化视图的使用self.contentView.frame 一直是320*44 的问题。
swift限制文本输入好像更简单一些。

5.day5. 简单的图片浏览器 UICollectionView
使用UICollectionView 创建一个简单的图片浏览器。 简单查看大图功能

6.day6. 系统图库，保存图片到相册
使用系统方法，保存、导入图片
#### TODO：一次导入多张图片. 这个不能使用系统相册，要自定义

7.day7.调用相机和图库
模拟器不能使用相机，没有拿真机测试。  周末有事，停更了两天。罪过

8.day8.播放音乐，背景色渐变
使用cocoapods 导入一个第三方snap库布局。  使用定时器改变背景渐变色。 播放音频功能

9.day9.简单的swipecell
tableView  swipeCell  使用系统自带代理方法。 展示cell加一个小动画效果。 注意动画加的位置

10.day10.视频播放 以及 tableView 拖拽顶部View
视频播放 + 拖动table 顶部VIew跟着放大缩小.   
##### TODO：自定义一个视频播放器

11.day11. 颜色渐变的collectionVIew
之前写过的内容。 今天没有灵感，没找到素材 没有心情， 写了一个重复的

12.day12. 视图展示动画 以及 UIPickView的简单使用
进入到界面，动态添加视图效果。 pickView的简单使用。

13.day13. subViews动态进入界面，tableView 删除行以及拖动

14.day14. 启动动作做一个简单的动画。  

15.day15. UITableViewController 的使用，以及界面直接的转场动画。

16.day16. 3DTouch 简单实现。

17.day17. 简单实现spotlight功能
实现完想了一下，除了新闻、资讯、实时热点类的APP，其他APP意义不大。  系统已经实现了名称Spotlight搜索，对于非新闻、资讯类够用了。

18.day18. Today widght 功能简单实现。
注意点：传值的时候，UserDefault。的suitName 要和group name一致才可以。。 这个也没看出来有多大作用。

19.day19. Custom RefreshControl 自定义刷新控件

20.day20. CoreData 的简单使用

21.day21. BaseAnimation 的使用
小tips：swift里直接设置图片方法：        
/// imageV.image =  image Literal --> 出来占位图，双击， 然后选择你需要的图片。。
 imageV.image = #imageLiteral(resourceName: "666")
// 或者：cmd + shift + m，也可调出来所有的图片资源， 可以拖动到工程里

22.day22. Custom Transform style. 可以对比day15

23.day23. UICollectionViewController 继承。 cell渐变展示
学到了：直接继承UICollectionViewController的使用，以及'UICollectionView must be initialized with a non-nil layout parameter' 异常处理方法。
但是本文中Cell渐变样式持保留态度，觉得对性能有影响

24.day24. ImageScroll 实现一个简单的图片轮播器。 
本次实现用UICollectionView 简单实现。 加时间自动控制功能。

25.day25. ScrollImageEr 用ScrollView 实现一个优雅的图片轮播器，实现自定义转场效果。实现day29功能。

26.day26. TabBarAPP。 小型项目，tabbar创建.主要是tabbar的使用。

27.day27. ImageAvator. 替换头像

28.day28. WikiFace. 

29.day29. 机器学习 AR VR

30.day30. Swift5 新特性相关语法。 

其中day25、26、27可以继续深入参与完善。
#### End

