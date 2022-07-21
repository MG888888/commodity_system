<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="6">
        <el-input v-model="selectName" placeholder="请输入内容" />
      </el-col>
      <el-col :span="6">
        <el-button type="primary" @click="selectByName">搜索</el-button>
        <el-button type="primary" style="" @click="add">新增</el-button>
      </el-col>
    </el-row>

    <el-table
      :data="form"
      style="width: 100%"
    >
      <el-table-column
        prop="name"
        label="商品名称"
      />

      <el-table-column
        prop="createtime"
        label="创建日期"
      />

      <el-table-column
        prop="charge"
        label="负责人"
      />
      <el-table-column
        prop="isfinish"
        label="库存"
      />
      <el-table-column
        prop="updatetime"
        label="更新时间"
      />
      <el-table-column
        prop="detail"
        label="详情"
      />
      <el-table-column
        fixed="right"
        label="操作"
        width="120"
      >
        <template slot-scope="{ row }">
          <el-button
            type="text"
            size="small"
            @click="update(row)"
          >
            修改
          </el-button>
          <el-button
            type="text"
            size="small"
            @click="deleteProject(row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      style="textalign: right"
      layout="prev, pager, next,jumper,->,sizes,total"
      :current-page="1"
      :total="total"
      :page-size="limit"
      :page-count="7"
      :page-sizes="[3, 5, 10]"
      @current-change="handleChange"
      @size-change="sizeChange"
    />
    <el-dialog
      title="项目信息"
      :visible="dialogVisible"
      width="70%"
      :show-close="false"
    >
      <el-form ref="form" :model="tmform" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="商品名称">
              <el-input v-model="tmform.name" minlength="1" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="负责人">
              <el-input v-model="tmform.charge" minlength="1" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间">
              <el-date-picker
                v-model="tmform.createtime"
                type="datetime"
                placeholder="选择日期时间"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="更新时间">
              <el-date-picker
                v-model="tmform.updatetime"
                type="datetime"
                placeholder="选择日期时间"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="库存">
              <el-input v-model="tmform.isfinish" minlength="1" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="详情">
              <el-input v-model="tmform.detail" minlength="1" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click.native="close">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>

</template>

<script>
import projectApi from '@/api/project.js'
export default {
  data() {
    return {
      dialogVisible: false,
      form: [{
        createtime: '',
        name: '',
        charge: '',
        isfinish: '',
        updatetime: '',
        detail: ''
      }],
      tmform: {
        createtime: '',
        name: '',
        charge: '',
        isfinish: '',
        updatetime: '',
        detail: ''
      },
      page: 1,
      limit: 3,
      total: 0,
      selectName: ''
    }
  },
  mounted() {
    this.getList()
  },
  methods: {
    // 获取表单
    async getList() {
      const { page, limit } = this
      const result = await projectApi.getAllList({ page, limit })
      if (result.code === 200) {
        this.form = result.obj.records
        this.total = result.obj.total
      }
    },
    // 分页器获取参数
    handleChange(pager) {
      this.page = pager
      this.getList()
    },
    sizeChange(size) {
      this.limit = size
      this.getList()
    },
    add() {
      this.dialogVisible = true
    },
    close() {
      this.dialogVisible = false
      this.clear()
    },
    clear() {
      this.tmform = {
        createtime: '',
        name: '',
        charge: '',
        isfinish: '',
        updatetime: '',
        detail: ''
      }
    },
    async save() {
      this.dialogVisible = false
      const result = await projectApi.save(this.tmform)
      if (result.code === 200) {
        this.$message({
          message: '修改成功',
          type: 'success'
        })
        this.getList()
      } else {
        this.$message({
          message: '修改失败',
          type: 'warning'
        })
      }
      this.clear()
    },
    update(row) {
      this.tmform = { ...row }
      this.add()
    },
    // 删除
    deleteProject(row) {
      this.$confirm(`你确认删除${row.name}?`, '提示', {
        confirmButtonText: '确认',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(async() => {
          const result = await projectApi.delete(row.id)
          if (result.code === 200) {
            this.$message({
              message: '删除成功',
              type: 'success'
            })
            this.getList()
          } else {
            this.$message({
              message: '删除失败',
              type: 'warning'
            })
          }
        })
    },
    // 通过名称搜索
    async selectByName() {
      const { selectName } = this
      const result = await projectApi.selectByName({ selectName })
      if (result.code === 200) {
        this.form = result.obj
      }
    }

  }
}
</script>

<style lang='less' scoped>
.el-row {
  width: 100%;
  margin-bottom: 20px;
  &:last-child {
    margin-bottom: 0;
  }
}
.el-col {
  border-radius: 4px;
}
</style>
