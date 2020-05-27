# my-power-shell-module

### 此項目是爲了在powerShell中添加一些常用的alias，方便開發

1. 需要在powerShell的配置文件中添加如下一行
```
Import-Module my-module
```
2. powershell的配置文件地址可以輸入下面的命令查看, 如果沒有，可以自行創建
```
$profile
```

3. 重啓powerShell后就可以了

### 如何配置

1. 需要再my-moudle.psd1, 配置RootModule文件
   ```
   RootModule = 'my-module.psm1'
   ```
2. 需要一个唯一的GUID，可以通过powerShell命令行直接生成
    ```
    New-Guid
    ```
3. 新建my-module.psm1,在这里添加需要的alias, 定义需要export的成员方法   
   
   ```
   $exportModuleMemberParams = @{
    Function = @(
      'open',
    )}
    Export-ModuleMember @exportModuleMemberParams
   ```
4. 实现function
   这里默认打开当前的文件，function也可以直接参数
   ```
   function open {
     explorer .
   }
   ```

