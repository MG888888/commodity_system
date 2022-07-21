<style scoped>
#sector{
  width: 100%;
  height: 300px;
  margin: 0 auto;
}
</style>
<template>
  <div>
    <div id="sector" />
    <div id="mychart" :style="myChartStyle" />
  </div>
</template>

<script>
import echarts from 'echarts'
import projectApi from '@/api/project.js'
export default {
  name: 'Sector',
  data() {
    const nowDate = new Date()
    const date = {
      year: nowDate.getFullYear(),
      month: nowDate.getMonth() + 1,
      date: nowDate.getDate()
    }
    return {
      data: [
        { value: 1, name: '已完成项目' },
        { value: 100, name: '未完成项目' }
      ],
      date,
      xData: ['2月', '3月', '4月', '5月', '6月'], // 横坐标
      yData: [23, 24, 18, 25, 27], // 数据
      myChartStyle: { float: 'left', width: '80%', height: '350px' }
    }
  },
  watch: {},
  mounted() {
    this.initEcharts()
    this.initEcharts2()
  },
  created() {
  },
  methods: {
    async initEcharts2() {
      const result = await projectApi.countFinish()
      if (result.code === 200) {
        this.data[0].value = result.obj.finish
        this.data[1].value = result.obj.unfinish
      }
      const option = {
        title: {
          text: '项目完成情况',
          top: '5%',
          left: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c}'
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          top: '15%',
          data: ['已完成项目', '未完成项目']
        },
        series: [
          {
            name: '访问来源',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: this.data,
            itemStyle: {
              normal: {
                label: {
                  show: true,
                  formatter: '{b} : {c}'
                },
                labelLine: { show: true }
              }
            },
            emphasis: {
              itemStyle: {
                shadowBlur: 110,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }
      const mySector = echarts.init(document.getElementById('sector'))

      mySector.setOption(option)
      // 随着屏幕大小调节图表
      window.addEventListener('resize', () => {
        mySector.resize()
      })
    },
    async initEcharts() {
      // 基本柱状图
      const nowData = new Date()
      this.xData = [
        `${nowData.getMonth() - 3}月`,
        `${nowData.getMonth() - 2}月`,
        `${nowData.getMonth() - 1}月`,
        `${nowData.getMonth()}月`,
        `${nowData.getMonth() + 1}月`]

      const x = [this.date.month, this.date.month - 1, this.date.month - 2, this.date.month - 3, this.date.month - 4]
      x.forEach((item, index) => {
        if (parseInt(item) < 10) {
          x[index] = `${this.date.year}-0${item}`
        } else {
          x[index] = `${this.date.year}-${item}`
        }
      })
      const resp = [{ date: x[0] }, { date: x[1] }, { date: x[2] }, { date: x[3] }, { date: x[4] }]
      const result0 = await projectApi.countProject(resp[4])
      const result1 = await projectApi.countProject(resp[3])
      const result2 = await projectApi.countProject(resp[2])
      const result3 = await projectApi.countProject(resp[1])
      const result4 = await projectApi.countProject(resp[0])
      this.yData = [result0.obj.res, result1.obj.res, result2.obj.res, result3.obj.res, result4.obj.res]
      const option = {
        title: {
          text: '项目创建情况',
          top: '5%',
          left: 'center'
        },
        xAxis: {
          data: this.xData
        },
        yAxis: {},
        series: [
          {
            type: 'bar', // 形状为柱状图
            data: this.yData
          }
        ]
      }
      const myChart = echarts.init(document.getElementById('mychart'))
      myChart.setOption(option)
      // 随着屏幕大小调节图表
      window.addEventListener('resize', () => {
        myChart.resize()
      })
    }
  }
}
</script>

