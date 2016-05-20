# Core-Animation-Demo01
Core Animation核心动画基础教程学习实例之树形动画的简单实现
## **demo**中用到的核心动画有：  
> 1. 弹性动画`CASpringAnimation`
> 2. 支持路径的关键帧动画`CAKeyframeAnimation`
> 3. 组合动画`CAAnimationGroup`

demo，支持故事版直接添加约束，主要是学习动画知识，还有其他问题，望见谅。其中重要属性设置    
```
  self.startPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
  self.nearDistance = 30;
  self.farDistance = 60;
  self.endDistance = 30;
```
## 没图说个L，最后附上效果图!  
![简单树形动画展示](https://github.com/AsTryE/Core-Animation-Demo01/blob/master/tree.gif)
