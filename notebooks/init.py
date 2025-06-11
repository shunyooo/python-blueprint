import nest_asyncio
import pandas as pd
from IPython import get_ipython
from IPython.display import clear_output
from tqdm.auto import tqdm

nest_asyncio.apply()

# -- ipython notebook  --
ipython = get_ipython()
if ipython is not None:
    ipython.run_line_magic("reload_ext", "autoreload")
    ipython.run_line_magic("autoreload", "2")

# plot の設定
pd.options.plotting.backend = "plotly"

# dataframe の表示設定
pd.set_option("display.max_columns", 100)
pd.set_option("display.max_colwidth", 500)
pd.set_option("display.max_rows", 200)

tqdm.pandas()
clear_output()
