1. 管理模块
	由专人维护物资信息，扩展django自带的admin模块

2. 调度模块
	1. 	根据阶段等参数，生成物资需求清单
		1.1 对每一种物资，提供详细存储情况清单，包括总量，分别存储地点
	2. 	根据物资需求清单和现有物资生成当前最优的物体提供清单，并提供
		自定义排序功能，手动维护每批物资的状态
			在库	待发	已发	已到	已交付

3.	未来
	1.	社会化维护，（灾时）动态追踪物资信息
	2.	提供地图相关的优化算法
